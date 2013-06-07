namespace :lzh do
  desc "update_avatar"
  task update: :environment do
    update_avatar
  end
end
def update_avatar
  infos=Info.all
  infos.each { |info| info.update_attributes(avatar:"1368165874332.jpg") }
end