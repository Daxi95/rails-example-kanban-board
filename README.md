# README

This is the 'Kanban Board' example app.
See https://backend-development.github.io/rails_view_and_controller.html

=== Study the Models ===

This Application already has two models: boards and cards.
Create the database and load the seed data by running
`rails db:setup`

=== Replace the Homepage === 

Redirect home to the list of kanban boards.

=== dependent models ===

Cards depend on their board and are deleted when the board
is deleted.  Delete a board and study the log file: how are the
cards deleted? Does Rails use referential integrity in the
database?

has_many :cards, dependent: :destroy
dadurch werden die Karten automatisch mit gelöscht

=== Nested Ressources === 

Study the URLs, controllers and actions by running `rails 
routes`. Now change `config/routes.rb` to 

    resources :boards do
      resources :cards
    end

How do the URLs change?

Auf die Karten kann nun folgendermaßen zugegriffen werden:
Beispiel: http://localhost:3000/boards/2/cards

board_cards GET    /boards/:board_id/cards(.:format)          cards#index
                POST   /boards/:board_id/cards(.:format)          cards#create
 new_board_card GET    /boards/:board_id/cards/new(.:format)      cards#new
edit_board_card GET    /boards/:board_id/cards/:id/edit(.:format) cards#edit
     board_card GET    /boards/:board_id/cards/:id(.:format)      cards#show
                PATCH  /boards/:board_id/cards/:id(.:format)      cards#update
                PUT    /boards/:board_id/cards/:id(.:format)      cards#update
                DELETE /boards/:board_id/cards/:id(.:format)      cards#destroy


=== Changes in `cards_controller` ===

Change the card_controller to
always read `params[:board_id]`.  You can use
a `before_action` to do that!

The index-action should
only show cards of this board.  

When creating or updating a card
there should be no input-field for `board_id` in the form,
the `board_id` is already specified by the url.


=== Display the Kanban Board ===

Research what a kanban board shold look like.
Change the show-view of board to look like this.





