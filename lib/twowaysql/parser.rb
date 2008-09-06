#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/twowaysql/parser.y".
#

require 'racc/parser'


module TwoWaySQL

  class Parser < Racc::Parser

module_eval <<'..end lib/twowaysql/parser.y modeval..id5bd1c17097', 'lib/twowaysql/parser.y', 138

require 'strscan'

def initialize(opts={})
  opts = {
    :debug => true,
    :preserve_space => true,
    :preserve_comment => true,
    :preserve_eol => true
  }.merge(opts)
  @yydebug = opts[:debug]
  @preserve_space = opts[:preserve_space]
  @preserve_comment = opts[:preserve_comment]
  @preserve_eol = opts[:preserve_eol]
  @num_questions = 0
end


PAREN_EXAMPLE                = '\([^\)]+\)'
BEGIN_BIND_VARIABLE          = '(\/|\#)\*([^\*]+)\*\1'
BIND_VARIABLE_PATTERN        = /\A#{BEGIN_BIND_VARIABLE}\s*/
PAREN_BIND_VARIABLE_PATTERN  = /\A#{BEGIN_BIND_VARIABLE}\s*#{PAREN_EXAMPLE}/
EMBED_VARIABLE_PATTERN       = /\A(\/|\#)\*\$([^\*]+)\*\1\s*/

CONDITIONAL_PATTERN   = /\A(\/|\#)\*(IF)\s+([^\*]+)\s*\*\1/
BEGIN_END_PATTERN     = /\A(\/|\#)\*(BEGIN|END)\s*\*\1/
QUOTED_STRING_PATTERN = /\A(\'(?:[^\']+|\'\')*\')/   ## quoted string
SPLIT_TOKEN_PATTERN   = /\A(\S+?)(?=\s*(?:(?:\/|\#)\*|-{2,}|\(|\)|\,))/  ## stop on delimiters --,/*,#*,',',(,)
ELSE_PATTERN          = /\A\-{2,}\s*ELSE\s*/
AND_PATTERN           = /\A(\s*AND\s+)/
OR_PATTERN            = /\A(\s*OR\s+)/
LITERAL_PATTERN       = /\A([^;\s]+)/
SPACES_PATTERN        = /\A(\s+)/
QUESTION_PATTERN      = /\A\?/
COMMA_PATTERN         = /\A\,/
LPAREN_PATTERN        = /\A\(/
RPAREN_PATTERN        = /\A\)/
ACTUAL_COMMENT_PATTERN          = /\A(\/|\#)\*\s+(.+)\s*\*\1/  ## start with spaces
SEMICOLON_AT_INPUT_END_PATTERN  = /\A\;\s*\Z/
UNMATCHED_COMMENT_START_PATTERN = /\A(?:(?:\/|\#)\*)/


def parse( io )
  @q = []
  io.each_line do |line|
    s = StringScanner.new(line.rstrip)
    until s.eos? do
      case
      when s.scan(AND_PATTERN)
        @q.push [ :AND, s[1] ]
      when s.scan(OR_PATTERN)
        @q.push [ :OR, s[1] ]
      when s.scan(SPACES_PATTERN)
        @q.push [ :SPACES, s[1] ] if @preserve_space
      when s.scan(QUESTION_PATTERN)
        @q.push [ :QUESTION, nil ]
      when s.scan(COMMA_PATTERN)
        @q.push [ :COMMA, ',' ]
      when s.scan(LPAREN_PATTERN)
        @q.push [ :LPAREN, '(' ]
      when s.scan(RPAREN_PATTERN)
        @q.push [ :RPAREN, ')' ]
      when s.scan(ELSE_PATTERN)
        @q.push [ :ELSE, nil ]
      when s.scan(ACTUAL_COMMENT_PATTERN)
        @q.push [ :ACTUAL_COMMENT, s[2] ] if @preserve_comment
      when s.scan(BEGIN_END_PATTERN)
        @q.push [ s[2].intern, nil ]
      when s.scan(CONDITIONAL_PATTERN)
        @q.push [ s[2].intern, s[3] ]
      when s.scan(EMBED_VARIABLE_PATTERN)
        @q.push [ :EMBED_VARIABLE, s[2] ]
      when s.scan(PAREN_BIND_VARIABLE_PATTERN)
        @q.push [ :PAREN_BIND_VARIABLE, s[2] ]
      when s.scan(BIND_VARIABLE_PATTERN)
        @q.push [ :BIND_VARIABLE, s[2] ]
      when s.scan(QUOTED_STRING_PATTERN)
        @q.push [ :QUOTED, s[1] ]
      when s.scan(SPLIT_TOKEN_PATTERN)
        @q.push [ :CHARS, s[1] ]
      when s.scan(UNMATCHED_COMMENT_START_PATTERN)   ## unmatched comment start, '/*','#*'
        raise Racc::ParseError, "## unmatched comment. cannot parse [#{s.rest}]"
      when s.scan(LITERAL_PATTERN)   ## other string token
        @q.push [ :CHARS, s[1] ]
      when s.scan(SEMICOLON_AT_INPUT_END_PATTERN)
        #drop semicolon at input end
      else
        raise Racc::ParseError, "## cannot parse [#{s.rest}]"
      end
    end
      
    @q.push [ :EOL, nil ] if @preserve_eol
  end
    
  @q.push [ false, nil ]
    
  ## cal racc's private parse method
  do_parse
end

def next_token
  @q.shift
end
..end lib/twowaysql/parser.y modeval..id5bd1c17097

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 21, :_reduce_1,
 0, 22, :_reduce_2,
 2, 22, :_reduce_3,
 1, 23, :_reduce_none,
 1, 23, :_reduce_none,
 1, 23, :_reduce_none,
 3, 26, :_reduce_7,
 4, 25, :_reduce_8,
 2, 28, :_reduce_9,
 0, 28, :_reduce_10,
 1, 27, :_reduce_none,
 1, 27, :_reduce_none,
 1, 27, :_reduce_none,
 2, 29, :_reduce_14,
 2, 30, :_reduce_15,
 1, 24, :_reduce_16,
 1, 24, :_reduce_17,
 1, 24, :_reduce_18,
 1, 24, :_reduce_19,
 1, 24, :_reduce_20,
 1, 24, :_reduce_21,
 1, 24, :_reduce_22,
 1, 24, :_reduce_23,
 1, 24, :_reduce_24,
 1, 24, :_reduce_25,
 1, 24, :_reduce_26,
 1, 24, :_reduce_none,
 1, 24, :_reduce_none,
 2, 31, :_reduce_29,
 3, 31, :_reduce_30,
 2, 31, :_reduce_31,
 3, 31, :_reduce_32,
 1, 31, :_reduce_33,
 2, 32, :_reduce_34,
 3, 32, :_reduce_35 ]

racc_reduce_n = 36

racc_shift_n = 49

racc_action_table = [
     7,    36,    12,    37,    16,    18,    20,    22,    24,     3,
     4,     6,     9,    11,    14,    15,    17,    19,     7,    46,
    12,    40,    16,    18,    20,    22,    24,     3,     4,     6,
     9,    11,    14,    15,    17,    19,     7,    48,    12,    38,
    16,    18,    20,    22,    24,     3,     4,     6,     9,    11,
    14,    15,    17,    19,     7,    39,    12,    25,    16,    18,
    20,    22,    24,     3,     4,     6,     9,    11,    14,    15,
    17,    19,     7,   nil,    12,   nil,    16,    18,    20,    22,
    24,     3,     4,     6,     9,    11,    14,    15,    17,    19,
    33,    34,    35,    29,    30,    29,    30,    44,    45 ]

racc_action_check = [
     1,    19,     1,    19,     1,     1,     1,     1,     1,     1,
     1,     1,     1,     1,     1,     1,     1,     1,    43,    37,
    43,    28,    43,    43,    43,    43,    43,    43,    43,    43,
    43,    43,    43,    43,    43,    43,    42,    41,    42,    25,
    42,    42,    42,    42,    42,    42,    42,    42,    42,    42,
    42,    42,    42,    42,    26,    26,    26,     2,    26,    26,
    26,    26,    26,    26,    26,    26,    26,    26,    26,    26,
    26,    26,    27,   nil,    27,   nil,    27,    27,    27,    27,
    27,    27,    27,    27,    27,    27,    27,    27,    27,    27,
    15,    15,    15,    12,    12,    40,    40,    35,    35 ]

racc_action_pointer = [
   nil,    -2,    57,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    87,   nil,   nil,    82,   nil,   nil,   nil,    -7,
   nil,   nil,   nil,   nil,   nil,    39,    52,    70,    16,   nil,
   nil,   nil,   nil,   nil,   nil,    89,   nil,    11,   nil,   nil,
    89,    34,    34,    16,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
    -2,    -1,   -36,   -21,   -22,    -3,   -23,    -2,    -4,   -24,
    -5,   -25,    -2,    -6,   -26,   -36,   -18,   -33,   -19,   -36,
   -16,   -27,   -17,   -28,   -20,   -36,   -36,   -13,   -10,    -2,
    -2,   -11,   -12,   -31,   -29,   -36,   -34,   -36,    49,    -7,
    -2,   -36,   -14,   -15,   -32,   -30,   -35,    -9,    -8 ]

racc_goto_table = [
     1,     2,    41,    28,   nil,   nil,   nil,    26,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    42,
    43,    47 ]

racc_goto_check = [
     2,     1,     8,     7,   nil,   nil,   nil,     2,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2,
     2,     7 ]

racc_goto_pointer = [
   nil,     1,     0,   nil,   nil,   nil,   nil,    -9,   -26,   nil,
   nil,   nil,   nil ]

racc_goto_default = [
   nil,   nil,    27,     5,     8,    10,    13,   nil,   nil,    31,
    32,    21,    23 ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :BEGIN => 2,
 :END => 3,
 :IF => 4,
 :ELSE => 5,
 :AND => 6,
 :OR => 7,
 :CHARS => 8,
 :QUOTED => 9,
 :SPACES => 10,
 :COMMA => 11,
 :LPAREN => 12,
 :RPAREN => 13,
 :QUESTION => 14,
 :ACTUAL_COMMENT => 15,
 :EOL => 16,
 :BIND_VARIABLE => 17,
 :PAREN_BIND_VARIABLE => 18,
 :EMBED_VARIABLE => 19 }

racc_use_result_var = true

racc_nt_base = 20

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'BEGIN',
'END',
'IF',
'ELSE',
'AND',
'OR',
'CHARS',
'QUOTED',
'SPACES',
'COMMA',
'LPAREN',
'RPAREN',
'QUESTION',
'ACTUAL_COMMENT',
'EOL',
'BIND_VARIABLE',
'PAREN_BIND_VARIABLE',
'EMBED_VARIABLE',
'$start',
'sql',
'stmt_list',
'stmt',
'primary',
'if_stmt',
'begin_stmt',
'sub_stmt',
'else_stmt',
'and_stmt',
'or_stmt',
'bind_var',
'embed_var']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 8
  def _reduce_1( val, _values, result )
                  result = RootNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 13
  def _reduce_2( val, _values, result )
                  result = []
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 17
  def _reduce_3( val, _values, result )
                  result.push val[1]
   result
  end
.,.,

 # reduce 4 omitted

 # reduce 5 omitted

 # reduce 6 omitted

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 26
  def _reduce_7( val, _values, result )
                  result = BeginNode.new( val[1] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 31
  def _reduce_8( val, _values, result )
                  result = IfNode.new( val[0], val[1], val[2] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 36
  def _reduce_9( val, _values, result )
                  result = val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 40
  def _reduce_10( val, _values, result )
                  result = nil
   result
  end
.,.,

 # reduce 11 omitted

 # reduce 12 omitted

 # reduce 13 omitted

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 49
  def _reduce_14( val, _values, result )
                  result = SubStatementNode.new( val[0], val[1] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 54
  def _reduce_15( val, _values, result )
                  result = SubStatementNode.new( val[0], val[1] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 59
  def _reduce_16( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 63
  def _reduce_17( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 67
  def _reduce_18( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 71
  def _reduce_19( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 75
  def _reduce_20( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 79
  def _reduce_21( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 83
  def _reduce_22( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 87
  def _reduce_23( val, _values, result )
                  result = LiteralNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 92
  def _reduce_24( val, _values, result )
                  @num_questions += 1
                  result = QuestionNode.new( @num_questions )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 96
  def _reduce_25( val, _values, result )
                  result = CommentNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 100
  def _reduce_26( val, _values, result )
                  result = EolNode.new
   result
  end
.,.,

 # reduce 27 omitted

 # reduce 28 omitted

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 107
  def _reduce_29( val, _values, result )
                  result = BindVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 111
  def _reduce_30( val, _values, result )
                  result = BindVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 115
  def _reduce_31( val, _values, result )
                  result = BindVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 119
  def _reduce_32( val, _values, result )
                  result = BindVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 123
  def _reduce_33( val, _values, result )
                  result = ParenBindVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 128
  def _reduce_34( val, _values, result )
                  result = EmbedVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 132
  def _reduce_35( val, _values, result )
                  result = EmbedVariableNode.new( val[0] )
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

  end   # class Parser

end   # module TwoWaySQL
