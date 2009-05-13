module TagsHelper
  def tags_for_select
    tags = Tag.all.sort {|tag1, tag2| tag1.id <=> tag2.id } #order by id
    first = tags.shift #take away tag "anything" which is always the first becuase it has id=1
    tags.sort! {|tag1, tag2| t(tag1.ki) <=> t(tag2.ki) } #order by translation
    tags.unshift(first) #reinsert the first one
    tags.collect {|tag| [t(tag.ki), tag.id]}
  end
  
  def tags_for_filter
    Tag.all(:conditions => "number_of_stories > 0").sort {|tag1, tag2| t(tag1.ki) <=> t(tag2.ki) }.collect {|tag| [t(tag.ki), tag.id]}
  end
  
  def tags_for_list
    Tag.all(:conditions => "number_of_stories > 0").sort {|tag1, tag2| tag2.number_of_stories <=> tag1.number_of_stories }
  end
end
