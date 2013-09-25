Then(/^there should be no links$/) do
  expect(page.has_xpath? '//section/ul').to be_false
  expect(page.has_xpath?('//section/ul/li')).to be_false
end

Then(/^there should be a list of links$/) do
  expect(page.has_xpath? '//section/ul').to be_true
  expect(page.has_xpath?('//section/ul/li')).to be_true
end