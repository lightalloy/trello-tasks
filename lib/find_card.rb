require 'trello'
require './config/config'
require './config/trello'

class FindCard
  def initialize(config = Config)
    @config = config
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    list = find_user.yield_self { |u| find_board(u) }
                    .yield_self { |b| find_list(b) }
    # list = find_list(find_board(find_user))
    card = list.cards.detect { |c| c.name == config.card_name }
    card || Trello::Card.create(name: config.card_name, board_id: board.id, list_id: list.id)
  end

  private

  attr_reader :config

  def find_user
    user = Trello::Member.find(config.user_name)
    raise MemberNotFound unless user
    user
  end

  def find_board(user)
    board = user.boards.detect { |b| b.name == config.board_name }
    raise BoardNotFound unless board
    board
  end

  def find_list(board)
    list = board.lists.detect { |l| l.name == config.list_name }
    raise ListNotFound unless list
    list
  end
end

class MemberNotFound < StandardError; end
class BoardNotFound < StandardError; end
class ListNotFound < StandardError; end
