# projects
projects = [
  {:key => "gnobles", :name => "Gnobles", :starts_at => "2010-01-18", :ends_at => "2010-03-05",
    :description => "Web platform for small companies gathering funding and for people investing in small companies.",
    :technologies => "Ruby on Rails, RSpec, Cucumber, JQuery, Postgres, TDD, BDD, Kanban",
    :contact_email => "pekka.abrahamsson@cs.helsinki.fi",
    :contact_text => "Pekka Abrahamsson",
    :study_keys => ["psycho", "waste_marko", "gradu_henri", "gradu_elena"]},
  {:key => "yfactor", :name => "Y-Factor", :starts_at => "2010-03-15", :ends_at => "2010-05-07",
    :description => "Generic recommendation plug-in for online stores. \"People who bought this bought also that.\"",
    :technologies => "Ruby on Rails, Redis, Cucumber, JQuery, MySQL, Kanban",
    :contact_email => "adrian.flanagan@gmail.com",
    :contact_text => "Adrian Flanagan",
    :study_keys => ["psycho", "waste_marko", "gradu_henri"]},
  {:key => "planesweep", :name => "Planesweep", :starts_at => "2010-05-17", :ends_at => "2010-07-02",
    :description => "Airplane cleaning management system.",
    :technologies => "Scala, Lift, CouchDB, JavaScript, TDD, Kanban",
    :contact_email => "esko.luontola@cs.helsinki.fi",
    :contact_text => "Esko Luontola",
    :study_keys => ["psycho", "waste_marko"]},
  {:key => "ee-potd", :name => "Event Experience", :starts_at => "2010-09-06", :ends_at => "2010-10-21",
    :description => "Event Experience is a new business innovation that utilizes social networks and open APIs. Event Experience Facebook application combines social networks and open APIs to provide a unified event experience.",
    :technologies => "Python, Django, JavaScript, Sonera API, Facebook Developers, TDD, Kanban",
    :contact_email => "vesa.suikkola@tkk.fi",
    :contact_text => "Vesa Suikkola",
    :study_keys => ["psycho", "waste_marko"]
  },
  {:key => "autumn2010-2", :name => "Autumn 2", :starts_at => "2010-11-01", :ends_at => "2010-12-17"},
]

Project.destroy_all # remove this if an admin page for projects is created
projects.each do |project|
  Project.create!(project) unless Project.find(:first, :conditions => {:key => project[:key]})
end

# studies
studies = [
  {:key => "gradu_henri", :title => "Self-organizing software development teams", :researchers => "Henri Karhatsu",
    :research_methods => "Participant observation, thematic interviews",
    :description => "Master's thesis of building self-organizing software development teams.",
    :contact_email => "henri.karhatsu@karhatsu.com",
    :contact_text => "Henri Karhatsu",
    :project_keys => ["gnobles", "yfactor"]},
  {:key => "gradu_elena", :title => "Kanban study", :researchers => "Elena Pirinen",
    :research_methods => "Direct observation, video observation, thematic interviews",
    :description => "Master's thesis of how Kanban's influence on software developer's work and how value flows in Kanban.",
    :contact_email => "elena.pirinen@helsinki.fi",
    :contact_text => "Elena Pirinen",
    :project_keys => ["gnobles"]},
  {:key => "psycho", :title => "Interpersonal interaction and group processes: the impact of personality and situation",
    :researchers => "Markku Verkasalo, Sointu Leikas, Jan-Erik Lonnqvist, Ville Ilmarinen (Institute of Behavioural Sciences, Department of Psychology, University of Helsinki)",
    :research_methods => "Self-reports of personality, work stress, mood, and work satisfaction via questionnaires. Experience sampling of self-report ratings of social interactions via palmtop computers. Video observation.",
    :description => "Examining basic relations between objective features of a situation, subjective experience of a situation, personality, affect, and behavior.",
    :contact_email => "sointu.leikas@helsinki.fi",
    :contact_text => "Sointu Leikas",
    :project_keys => ["gnobles", "yfactor", "planesweep", "ee-potd"]},
  {:key => "waste_marko", :title => "Beyond project waste", :researchers => "Marko Ikonen",
    :research_methods => "Direct observation, thematic interviews, video observation, questionnaires",
    :contact_email => "marko.ikonen@cs.helsinki.fi",
    :contact_text => "Marko Ikonen",
    :project_keys => ["gnobles", "yfactor", "planesweep, ee-potd"],
    :description => "When the customer value is the most important"},
]

Study.destroy_all # remove this if an admin page for studies is created
studies.each do |study|
  Study.create!(study) unless Study.find(:first, :conditions => {:key => study[:key]})
end

# text fragments
keys_and_values = [
  ]

keys_and_values.each do |pair|
  TextFragment.create!(:key => pair[0], :value => pair[1]) unless TextFragment.find(:first, :conditions => {:key => pair[0]})
end
