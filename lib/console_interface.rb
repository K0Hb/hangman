require 'colorize'

class ConsoleInterface
  FIGURES_PATH = "#{__dir__}/../data/figures/*.txt"
  FIGUERS = Dir[FIGURES_PATH].sort.map { |file_name| File.read(file_name) }

  attr_reader :figures

  def initialize(game)
    @game = game
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def figure
    FIGUERS[@game.errors_made]
  end

  def get_input
    print 'Введите следующую букву: '.colorize(:light_cyan)
    gets[0].upcase
  end

  def print_out
    puts "Слово: #{word_to_show}".colorize(:white)
    puts "#{figure}".colorize(:light_black)
    puts "Ошибки (#{@game.errors_made}): #{errors_to_show}".colorize(:red)
    puts "У вас осталось ошибок: #{@game.errors_allowed}".colorize(:light_yellow)

    if @game.won?
      puts 'Поздравляем, вы выиграли!'.colorize(:light_green)
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}".colorize(:red)
    end
  end

  def word_to_show
    @game.letters_to_guess.map { |letter| letter || '__' }.join(' ')
  end
end
