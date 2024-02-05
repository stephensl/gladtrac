json.extract! student, :id, :user_id, :cohort_start, :about_me, :created_at, :updated_at
json.url student_url(student, format: :json)
