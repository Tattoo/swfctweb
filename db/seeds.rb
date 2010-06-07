# projects
projects = [
  {:key => "gnobles", :name => "Gnobles", :starts_at => "2010-01-18", :ends_at => "2010-03-05",
    :description => "Web platform for small companies gathering funding and for people investing in small companies.",
    :technologies => "Ruby on Rails, RSpec, Cucumber, JQuery, Postgres, TDD, BDD, Kanban",
    :study_keys => ["gradu_henri", "gradu_elena", "psycho"]},
  {:key => "yfactor", :name => "Y-Factor", :starts_at => "2010-03-15", :ends_at => "2010-05-07",
    :description => "Generic recommendation plug-in for online stores. \"People who bought this bought also that.\"",
    :technologies => "Ruby on Rails, Redis, Cucumber, JQuery, MySQL, Kanban",
    :study_keys => ["gradu_henri", "psycho"]},
  {:key => "planesweep", :name => "Planesweep", :starts_at => "2010-05-17", :ends_at => "2010-07-02",
    :description => "Airplane cleaning management system.",
    :technologies => "Scala, Lift, CouchDB, Javascript, TDD, Kanban",
    :study_keys => ["psycho"]},
  {:key => "autumn2010-1", :name => "Autumn 1", :starts_at => "2010-09-06", :ends_at => "2010-10-21"},
  {:key => "autumn2010-2", :name => "Autumn 2", :starts_at => "2010-11-01", :ends_at => "2010-11-17"},
]

projects.each do |project|
  Project.create(project) unless Project.find(:first, :conditions => {:key => project[:key]})
end

# studies
studies = [
  {:key => "gradu_henri", :title => "Master's thesis (Henri Karhatsu)", :researchers => "Henri Karhatsu",
    :research_methods => "Participant observation, thematic interviews",
    :project_keys => ["gnobles", "yfactor"]},
  {:key => "gradu_elena", :title => "Master's thesis (Elena Pirinen)", :researchers => "Elena Pirinen",
    :research_methods => "Participant observation, thematic interviews",
    :project_keys => ["gnobles"]},
  {:key => "psycho", :title => "Psychological research",
    :researchers => "Markku Verkasalo, Sointu Leikas, Jan-Erik Lonnqvist, Ville Ilmarinen (Institute of Behavioural Sciences, Department of Psychology, University of Helsinki)",
    :project_keys => ["gnobles", "yfactor", "planesweep"]},
]

studies.each do |study|
  Study.create(study) unless Study.find(:first, :conditions => {:key => study[:key]})
end

# text fragments
keys_and_values = [
  ]

keys_and_values.each do |pair|
  TextFragment.create(:key => pair[0], :value => pair[1]) unless TextFragment.find(:first, :conditions => {:key => pair[0]})
end