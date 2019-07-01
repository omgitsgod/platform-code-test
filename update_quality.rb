require 'award'

def update_quality(awards)
  awards.each do |award|
    case
      when award.name == 'NORMAL ITEM' && award.quality > 0 then award.quality -= 1
      when award.name == 'Blue Star' && award.quality > 0 then award.quality -= 2
      when award.name == 'Blue First' && award.quality < 50 then award.quality += 1
      when award.name == 'Blue Compare' && award.expires_in > 10 && award.quality < 50 then award.quality += 1
      when award.name == 'Blue Compare' && award.expires_in < 6 && award.quality < 50 then award.quality += 3
      when award.name == 'Blue Compare' && award.expires_in < 11 && award.quality < 50 then award.quality += 2
    end
    case
      when award.name != 'Blue Distinction Plus' then award.expires_in -= 1
    end
    case
      when award.expires_in < 0 && award.name == 'Blue First' && award.quality < 50 then award.quality += 1
      when award.expires_in < 0 && award.name == 'Blue Compare' then award.quality = award.quality - award.quality
      when award.expires_in < 0 && award.name == 'NORMAL ITEM' && award.quality > 0 then award.quality -= 1
      when award.expires_in < 0 && award.name == 'Blue Star' && award.quality > 0 then award.quality -= 2
    end
  end
end
