# Active Record
### Common database commands.

These commands are used in a migration file, which you create in Rails using `rails generate migration MigrationName`.

The migration file looks like this: 
```ruby
class RemoveStudentsTable < ActiveRecord::Migration[7.1]
  def change
    # <operations: eg. `drop_table :students`>
  end
end
```

## Creating Tables
```ruby
create_table :table_name do |t|
  t.column_type :column_name
  
  # Examples:
  t.string :name
  t.integer :age
  t.timestamps # Adds created_at and updated_at
end
```
## Dropping Tables
```ruby
drop_table :table_name
```

## Adding Columns
```ruby
add_column :table_name, :column_name, :column_type

# Example:
add_column :users, :email, :string
```

## Removing Columns
```ruby
remove_column :table_name, :column_name, :column_type

# Example:
remove_column :users, :email, :string
```

## Renaming Columns
```ruby
rename_column :table_name, :old_column_name, :new_column_name
```

## Changing Columns
```ruby
change_column :table_name, :column_name, :new_type

# Example:
change_column :users, :email, :text
```

## Adding Indexes
```ruby
add_index :table_name, :column_name

# For multiple columns:
add_index :table_name, [:column1, :column2]
```

## Removing Indexes
```ruby
remove_index :table_name, :column_name

# For multiple columns:
remove_index :table_name, column: [:column1, :column2]
```

## Changing Table Names
```ruby
rename_table :old_table_name, :new_table_name
```

## Adding Foreign Keys
```ruby
add_foreign_key :child_table, :parent_table
```

## Removing Foreign Keys
```ruby
remove_foreign_key :child_table, :parent_table
```

## Truncate Tables
*ActiveRecord doesn't have a direct truncate method. You can execute raw SQL*:
```ruby
ActiveRecord::Base.connection.execute("TRUNCATE table_name")
```

## Creating Join Tables
```ruby
create_join_table :table1, :table2 do |t|
  t.index :table1_id
  t.index :table2_id
end
```

### Running Migrations
  - To run migrations: `rails db:migrate`
  - To roll back the last migration: `rails db:rollback`
  - To go to a specific version: `rails db:migrate VERSION=version_number`

#### Notes
  **:column_type** can be types like: 
  - :string
  - :text 
  - :integer 
  - :float 
  - :decimal
  - :datetime
  - :timestamp
  - :time
  - :date 
  - :binary
  - :boolean


##### Routes added via `devise`

| Prefix                        | Verb   | URI Pattern                 | Controller#Action               |
|-------------------------------|--------|-----------------------------|---------------------------------|
| new_user_session              | GET    | /users/sign_in(.:format)    | devise/sessions#new             |
| user_session                  | POST   | /users/sign_in(.:format)    | devise/sessions#create          |
| destroy_user_session          | DELETE | /users/sign_out(.:format)   | devise/sessions#destroy         |
| new_user_password             | GET    | /users/password/new(.:format) | devise/passwords#new          |
| edit_user_password            | GET    | /users/password/edit(.:format)| devise/passwords#edit         |
| user_password                 | PATCH  | /users/password(.:format)   | devise/passwords#update         |
|                               | PUT    | /users/password(.:format)   | devise/passwords#update         |
|                               | POST   | /users/password(.:format)   | devise/passwords#create         |
| cancel_user_registration      | GET    | /users/cancel(.:format)     | devise/registrations#cancel     |
| new_user_registration         | GET    | /users/sign_up(.:format)    | devise/registrations#new        |
| edit_user_registration        | GET    | /users/edit(.:format)       | devise/registrations#edit       |
| user_registration             | PATCH  | /users(.:format)            | devise/registrations#update     |
|                               | PUT    | /users(.:format)            | devise/registrations#update     |
|                               | DELETE | /users(.:format)            | devise/registrations#destroy    |
|                               | POST   | /users(.:format)            | devise/registrations#create     |


# Views added via `devise`

# Devise Views and Corresponding Routes

| Devise Module      | View File                                           | Route                               |
|--------------------|-----------------------------------------------------|-------------------------------------|
| `confirmations`    | [new.html.erb](./devise/confirmations/new.html.erb) | `new_user_confirmation GET`         |
| `mailer`           | [confirmation_instructions.html.erb](./devise/mailer/confirmation_instructions.html.erb) | *Email template, no direct route* |
|                    | [email_changed.html.erb](./devise/mailer/email_changed.html.erb) | *Email template, no direct route* |
|                    | [password_change.html.erb](./devise/mailer/password_change.html.erb) | *Email template, no direct route* |
|                    | [reset_password_instructions.html.erb](./devise/mailer/reset_password_instructions.html.erb) | *Email template, no direct route* |
|                    | [unlock_instructions.html.erb](./devise/mailer/unlock_instructions.html.erb) | *Email template, no direct route* |
| `passwords`        | [edit.html.erb](./devise/passwords/edit.html.erb)   | `edit_user_password GET`            |
|                    | [new.html.erb](./devise/passwords/new.html.erb)     | `new_user_password GET`             |
| `registrations`    | [edit.html.erb](./devise/registrations/edit.html.erb) | `edit_user_registration GET`      |
|                    | [new.html.erb](./devise/registrations/new.html.erb) | `new_user_registration GET`         |
| `sessions`         | [new.html.erb](./devise/sessions/new.html.erb)      | `new_user_session GET`              |
| `shared`           | [_error_messages.html.erb](./devise/shared/_error_messages.html.erb) | *Partial, used in other views*   |
|                    | [_links.html.erb](./devise/shared/_links.html.erb)  | *Partial, used in other views*     |
| `unlocks`          | [new.html.erb](./devise/unlocks/new.html.erb)       | `new_user_unlock GET`               |

Model: 

```ruby 
class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
```


![omniAuth diagram](https://developer.okta.com/assets-jekyll/blog/omniauth/omniauth-diagram-e360792c4909a94825a92c7d02614e5c7c283a62465a8dc3c17cbb907969bdb3.png)