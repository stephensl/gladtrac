json.extract! course, :id, :student_id, :name, :subject, :state_code, :local_code, :credit_type, :created_at, :updated_at
json.url course_url(course, format: :json)
