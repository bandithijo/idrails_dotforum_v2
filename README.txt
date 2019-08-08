# Rails Daily WorkOut

## Create Forum

1. Create new project dengan mysql/postgresql database

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

