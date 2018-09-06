class FindChecklist
  def initialize(card, name)
    @card = card
    @name = name
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    checklist = card.checklists.detect { |ch| ch.name == name }
    checklist || Trello::Checklist.create(name: name, card_id: card.id, board_id: card.board.id)
  end

  private

  attr_reader :card, :name
end
