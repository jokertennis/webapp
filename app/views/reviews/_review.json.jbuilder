json.extract! review, :id, :account_id, :product_title, :title, :review, :created_at, :updated_at
json.url review_url(review, format: :json)
