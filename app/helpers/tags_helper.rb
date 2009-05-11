module TagsHelper
  def tags_for_select
    Tag.all.sort {|tag1, tag2| tag1.ki <=> tag2.ki }.collect {|tag| [t(tag.ki), 
      tag.id]} #.unshift([t('anything'), "1"])
  end
  
  def tags_for_filter
    Tag.all(:conditions => "number_of_stories > 0").sort {|tag1, tag2| tag1.ki <=> tag2.ki }.collect {|tag| [t(tag.ki), tag.id]}
  end
  
  def tags_for_list
    Tag.all(:conditions => "number_of_stories > 0").sort {|tag1, tag2| tag2.number_of_stories <=> tag1.number_of_stories }
  end
end
