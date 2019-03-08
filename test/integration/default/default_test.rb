# # encoding: utf-8

# Inspec test for recipe R::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command('Rscript -e \'packageVersion("ape")\'') do
  its('exit_status') { should eq 0 }
end

describe command('Rscript -e \'packageVersion("optparse")\'') do
  its('exit_status') { should eq 0 }
end
