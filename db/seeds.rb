# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

dimitar = User.create!(:name => "Dimitar Haralanov",
                      :email => "dimitar@forebits.com",
                      :password => "qwerty",
                      :password_confirmation => "qwerty")

test = User.create!( :name => "Test User",
                    :email => "test@test.com",
                    :password => "testpass",
                    :password_confirmation => "testpass")



first_article = dimitar.articles.create(:title => %{Celebrate Thanksgiving with The Big Web Show},
                        :author => dimitar.name,
                        :published_at => Time.now, 
                        :body => %{JOIN DAN BENJAMIN AND ME Thursday 25 November on live.5by5.tv at 1:00 PM Eastern for a special Thanksgiving episode of The Big Web Show. The Big Web Show ("Everything Web That Matters") is recorded live in front of an internet audience every Thursday at 1:00 PM ET on live.5by5.tv. Edited episodes can be watched afterwards, often within hours of recording, via iTunes (audio feed | video feed) and the web. Subscribe and enjoy!})

second_article = dimitar.articles.create(:title => %{Gift Ideas: Japanese Beauties},
                        :author => dimitar.name,
                        :published_at => Time.now, 
                        :body => %{Representing the Japanese ideal of beauty, the women featured in these colorful illustrations and photographs beam with reassuring smiles and glowing complexions. Though haircuts and clothing styles changed through the years, the women's faces have retained the same familiar features Japanese society has come to know and love.})

test.articles.create( :title => %{Help Deserving Web Designers Find Fame},
                      :author => test.name,
                      :published_at => Time.now, 
                      :body => %{THE UNDER-KNOWN HAVE EVERYTHING going for them except recognition. Let's do something about that. Name talented web designers who deserve wider attention. Include at least one URL and a Twitter-length comment as to why their work merits wider study. Post to this thread. Thanks.})



first_article.comments.create(:name => "Comments Publisher Name",
                              :email => "commentspublishername@gmail.com",
                              :body => %{I'd say that this is an incredibly nice article! Congratulations, mate!},
                              :published_at => Time.now)

first_article.comments.create(:name => "My Cat",
                              :email => "mycat@gmail.com",
                              :body => %{Meow!},
                              :published_at => Time.now)