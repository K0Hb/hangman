class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.upcase.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - normilized_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      letter if @user_guesses.include?(normilize_latter(letter))
    end
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    @user_guesses << normilize_latter(letter) if !over? && !@user_guesses.include?(normilize_latter(letter))
  end

  def won?
    (normilized_letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end

  def normilize_latter(letter)
    letter.gsub(/[ЁЙ]/, 'Ё' => 'Е', 'Й' => 'И')
  end

  def normilized_letters
    @letters.map { |letter| normilize_latter(letter) }
  end
end
