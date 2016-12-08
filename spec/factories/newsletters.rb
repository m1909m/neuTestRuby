FactoryGirl.define do
  factory :newsletter do
    from "MyString"
    to "MyString"
    type ""
    newsHeader "MyText"
    newsBody "MyText"
    newsFooter "MyText"
    appendix "MyText"
  end
end
