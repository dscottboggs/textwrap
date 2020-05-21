require "string_scanner"

class String
  def wrap(width = 80)
    Textwrap::Scanner.new(self).wrap width
  end

  def zero
    ""
  end

  def self.zero
    ""
  end
end

struct Textwrap::Scanner
  WORD_SEPARATORS = /\s|-/
  WHITESPACE      = /\s/

  getter words : Iterator(String)
  @current_width = 0
  @wrapped_word : String?

  def initialize(@string : String)
    @words = @string.split(WHITESPACE, remove_empty: true).each
  end

  def wrap_paragraph(target_width : Number = 80, & : String -> _) : Nil
    done = false
    until done
      yield String.build target_width do |this_line|
        if w = @wrapped_word
          this_line << w
          @current_width = w.size
          @wrapped_word = nil
        end
        loop do
          this_word = @words.next
          if this_word.is_a? Iterator::Stop
            done = true
            break
          end
          if (@current_width + this_word.size) > target_width
            @wrapped_word = this_word
            @current_width = 0
            break
          end
          this_line << ' ' if @current_width > 0
          @current_width += this_word.size + 1
          this_line << this_word
        end
      end
    end
  end

  def wrap_paragraph(target_width : Number = 80) : String
    first = true
    String.build @string.size do |output|
      wrap_paragraph target_width do |line|
        output << '\n' unless first
        first = false
        output << line
      end
    end
  end

  def self.wrap_text(string, target_width : Number = 80)
    paragraphs = string.split '\n', remove_empty: true
    String.build string.size do |wrapped|
      paragraphs[...-1].each do |paragraph|
        wrapped << ((new paragraph).wrap_paragraph target_width) << '\n' << '\n'
      end
      wrapped << ((new paragraphs[-1]).wrap_paragraph target_width)
    end
  end
end # struct
