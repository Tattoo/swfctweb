# text fragments
keys_and_values = [
  ["research.text", "*Software Factory's* research trains effectively PhD students, performs basic and applied research in its operating context and performs tests for evaluating different research methods. Software factory provides a context for PhD students as well as Master's students to pursue their thinking further and challenge the common wisdom.\n\n*Software Factory* is designed for allowing a multitude of different ways to collect data unseen before. Cross-disciplinary research is part of the field of software engineering. Therefore the factory has an open call for research proposals to investigate team dynamics, programming psychology and beyond to fully make use of the opportunity at hand. Software Factory's research is built upon highest ethical rules and each research endeavor shall follow the Factory's research protocol as well as the outlined research design. "],
  ]

keys_and_values.each do |pair|
  TextFragment.create(:key => pair[0], :value => pair[1]) unless TextFragment.find(:first, :conditions => {:key => pair[0]})
end