json.extract! newsletter, :id, :from, :to, :type, :newsHeader, :newsBody, :newsFooter, :appendix, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)