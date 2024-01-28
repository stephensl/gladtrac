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

