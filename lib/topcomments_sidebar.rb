# TopcommentsSidebar
class TopcommentsSidebar < Sidebar
  display_name "Top commenters"
  description "Show top commenters on you blog (ranking is made with commenters name)"
  
  setting :title, "Top commenters"
  setting :maximum_commenters, 10
  
  def commenters
    Comment.find_by_sql("SELECT COUNT(id) AS comments, author, email, url FROM feedback WHERE type='Comment' GROUP BY author ORDER BY comments DESC LIMIT #{maximum_commenters}")
  end
end

