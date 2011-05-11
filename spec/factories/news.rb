Factory.define :new1 ,:class=>"New" do |u|
      u.title "Тест"
      u.img_url "none.jpg"
      u.value_date Date.today
      u.no 1
      u.menu_id 1
      u.program_id 1
      u.descr  "Какойнибудь текст новости"
      u.ntype 'NEWS'
end
