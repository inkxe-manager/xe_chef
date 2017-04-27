app = search("aws_opsworks_app").first
doc_root= app['attributes']['document_root']


default['lamp']['web']['document_root'] = doc_root


default['lamp']['database']['dbname'] = 'my_company'
default['lamp']['database']['admin_username'] = 'db_admin'