# Rails Daily WorkOut

## Create Forum

1. Create new project dengan mysql/postgresql database

2. Add gem pry-rails for switch default irb in rails console

3. Configure gem devise
    - Add `gem 'pry-rails` to Gemfile
    - Install dengan `$ rails g devise:install`
    - Create tabel User `$ rails g devise User`
    - Add column name:string & level:integer to migrate devise_create_user.rb

4. Create database
    - Run `$ rake db:create`
    - Run migration `$ rake db:migrate`
