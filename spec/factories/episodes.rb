FactoryBot.define do
  factory :episode do
    show { nil }
    name { "MyString" }
    link { "MyString" }
    description { "MyText" }
    show_notes { "MyText" }
    published_at { "MyString" }
    audio_file_url { "MyString" }
  end
end
