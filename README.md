A small tool to convert text (yaml) to trello checklists and trello checklists to text.  

Set up:  
- Set environment variables for the trello API (`DEVELOPER_PUBLIC_KEY` and `MEMBER_TOKEN`)
- `cp config/config.yml.example config/config.yml`.  
   Configure user, board, list and card, where you need to put checklists. A card will be created if it doesn't exist yet.
- `cp config/tasks.yml.example config/tasks.yml`.  
   Configure checklists and items you need to create.
- `bundle install`

Usage:
`bundle exec bin/create` -- creates card, checklist and items from the `config/tasks.yml` if they don't exist yet.
`bundle exec bin/print` -- outputs card checklists items to `STDOUT` as text.

