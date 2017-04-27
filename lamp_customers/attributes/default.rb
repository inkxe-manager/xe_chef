app = search("aws_opsworks_app").first
doc_root_lamp_cust = app['attributes']['document_root']

default['lamp']['web']['document_root'] = doc_root_lamp_cust
default['lamp']['database']['dbname'] = '4thcoffee'