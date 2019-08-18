# Rails Daily WorkOut

## Create Forum

1. Create new project with mysql/postgresql database

2. Add gem pry-rails for switch default irb in rails console

3. Configure gem devise
    - Add `gem 'pry-rails` to Gemfile
    - Install dengan `$ rails g devise:install`
    - Create tabel User `$ rails g devise User`
    - Add column name:string, limit: 100 & level:integer, default: 100

4. Create database
    - Run `$ rake db:create`
    - Run migration `$ rake db:migrate`

5. Create model for forum thread (with Rails generator)
    - Generated with `$ rails g model ForumThread title content:text sticky_order:integer user_id:integer`
    - Add title limit 100 character
    - Add sticky_order default value 100
    - Add user_id null false
    - Run this migration

6. Create model for forum post (with Rails generator)
    - Generated with `$ rails g model ForumPost content:text forum_thread_id:integer user_id:integer`
    - Add null: false every column
    - Run this migration

7. Create realation between tables
    - Users
        ```
        has_many :forum_threads
        has_many :forum_posts
        ```
    - ForumThread
        ```
        belongs_to :user
        has_many :forum_posts
        ```
    - ForumPost
        ```
        belongs_to :user
        belongs_to :forum_thread
        ```

8. Create 2 users, 3 forum_threads, 6 forum_posts

9. Install gem bootstrap & gem jquery-rails [source](https://github.com/twbs/bootstrap-rubygem)
    - Add `gem 'bootstrap'` & `gem 'jquery-rails'` to Gemfile
    - Add to app/assets/javascripts/application.js
        ```
        //= require jquery3
        //= require popper
        //= require bootstrap
        ```
    - Change application.css to app/assets/stylesheets/application.scss
        `@import "bootstrap";`

    - Add responsive meta tag [source](https://getbootstrap.com/docs/4.3/getting-started/introduction/#responsive-meta-tag)
        `<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">`

10. Create Thread list from database
    - Create controller forum_threads_controller.rb add action :index
    - Create view forum_threads/index.html.erb
    - Change route for root_path to 'forum_threads#index'

11. Create Navbar [source](https://getbootstrap.com/docs/4.3/components/navbar/)
    - Create with layout partial on app/views/layouts/_nav.html.erb
    - Arrange Navbar like this `[BRAND]-[HOME][ABOUT]---[SEARCHBAR][SEARCHBTN]-[DROPMENUACCOUNT]`
    - Set link_to for all menu

12. Configure Locale with i18n
    - Add on config/application.rb `config.i18n.default_locale = :id`
    - Create config/locales/id.yml [source](https://github.com/svenfuchs/rails-i18n/tree/master/rails/locale)
    - Modif created_at on forum_threads/index.html.erb, `I18n.l thread.created_at.to_date`

13. Create Thread detail
    - Create action :show in forum_threads_controller.rb
    - Create view forum_threads/show.html.erb
    - Create route for :show
    - Create forum_posts inside forum_thread

14. Add Counter Cache for stored forum_posts.count in single column
    - Go to app/models/forum_post.rb, add at the end `belong to :forum_thread, counter_cache: true`
    - Create migration `$ rails g migration AddForumPostsCountToForumThreads forum_posts_count:integer`
    - On migration add default: 0
    - Devide up & down
        ```
        def up
            add_column :forum_threads, :forum_posts_count, default: 0

            ForumThread.all.each do |t|
                ForumThread.reset_counters(t.id, :forum_posts)
            end
        end

        def down
            remove_column, :forum_threads, :forum_posts_count
        end
        ```
    - Run migration
    - Change on view, `thread.forum_posts.count` to `thread.forum_posts_count`

15. Create form new thread
    - Create button 'Buat Thread' on view forum_threads#index
        ```
        <%= link_to 'Buat Thread', new_forum_thread_path, class: 'btn btn-primary btn-lg btn-block' %>
        ```
    - Add :new :create on route resources :forum_threads
        ```
        resources :forum_threads, only: [:show, :new, :create]
        ```
    - Add action :new & :create
        ```
        def new
            @thread = ForumThread.new
        end

        def create
            @thread = forumthread.new(resource_params)
            @thread.user = current_user
            if @thread.save
                redirect_to root_path
            else
                render 'new'
            end
        end

        private

        def resource_params
            params.require(:forum_thread).permit(:title, :content)
        end
        ```
    - Change action :index fo order by descending
    - Create view for form_threads/new.html.erb
    - Add validation for form new thread
        ```
        validates :title, presence: true, length: {maximum: 100}
        validates :content, presence: true
        ```
    - Add alert errors on view forum_threads/new.html.erb
        ```
        <% if @thread.errors.any? %>
        <div class="notice">
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <% @thread.errors.full_messages.each do |error| %>
                    <%= error %><br>
                <% end %>
            </div>
        </div>
        <% end %>
        ```

16. Create form new post
    - Create controller, app/controllers/forum_posts_controller.rb with action :create
        ```
        def create
            @thread = ForumThread.find(params[:forum_thread_id])
            @post = ForumPost.new(resource_params)

            @post.forum_thread = @thread
            @post.user = current_user
            @post.save
            redirect_to forum_thread_path(@thread)
        end

        private

        def resource_params
            params.require(:forum_post).permit(:content)
        end
        ```
    - Create post route with nested resources
        ```
        resources :forum_threads, only: [:show, :new, :create] do
            resources :forum_posts, only: [:create]
        end
        ```
    - Craete view for forum_posts:create at view forum_threads#show
        ```
        <%= form_for [@thread, @post] do |post| %>
            ...
            ...
        <% end %>
        ```
    - Add @post at forum_threads#show
        ```
        @post = ForumPost.new
        ```
    - Add post validation on model, view and controller

17. Conditional rendering for Navbar using method from devise `user_signed_in?` and object `current_user`
    ```
    <%= user_signed_in? ? current_user.name : 'Hello, mas Bro!' %>
    ```

    ```
    <% unless user_signed_in? %>
        <%= link_to 'Daftar', new_user_registration_path, class: 'dropdown-item' %>
        <%= link_to 'Login', new_user_session_path, class: 'dropdown-item' %>
    <% else %>
        <%= link_to 'Logout', destroy_user_session_path, method: :delete, class: 'dropdown-item' %>
    <% end %>
    ```
