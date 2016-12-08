json.extract! newsletter, :id, :from, :newsHeader, :newsBody, :newsFooter, :appendix, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)