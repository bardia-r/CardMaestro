FactoryBot.define do
  factory :message do
    sender { 1 }
    receiver { 1 }
    contents { "MyString" }
    sent_at { "2019-12-02 19:41:58" }
    seen { false }
  end
end
