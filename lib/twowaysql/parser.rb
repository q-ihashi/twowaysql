#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/twowaysql/parser.y".
#

require 'racc/parser'


module TwoWaySQL

  class Parser < Racc::Parser

module_eval <<'..end lib/twowaysql/parser.y modeval..iddfb0e44df1', 'lib/twowaysql/parser.y', 134

require 'strscan'

def initialize(opts={})
  opts = {
    :debug => false,
    :preserve_space => true,
    :preserve_comment => false
  }.merge(opts)
  @yydebug = opts[:debug]
  @preserve_space = opts[:preserve_space]
  @preserve_comment = opts[:preserve_comment]
  @num_questions = 0
end


PAREN_EXAMPLE                = '\([^\)]+\)'
BEGIN_BIND_VARIABLE          = '(\/|\#)\*([^\*]+)\*\1'
BIND_VARIABLE_PATTERN        = /\A#{BEGIN_BIND_VARIABLE}\s*/
PAREN_BIND_VARIABLE_PATTERN  = /\A#{BEGIN_BIND_VARIABLE}\s*#{PAREN_EXAMPLE}/
EMBED_VARIABLE_PATTERN       = /\A(\/|\#)\*\$([^\*]+)\*\1\s*/

CONDITIONAL_PATTERN     = /\A(\/|\#)\*(IF)\s+([^\*]+)\s*\*\1/
BEGIN_END_PATTERN       = /\A(\/|\#)\*(BEGIN|END)\s*\*\1/
STRING_LITERAL_PATTERN  = /\A(\'(?:[^\']+|\'\')*\')/   ## quoted string
SPLIT_TOKEN_PATTERN     = /\A(\S+?)(?=\s*(?:(?:\/|\#)\*|-{2,}|\(|\)|\,))/  ## stop on delimiters --,/*,#*,',',(,)
LITERAL_PATTERN         = /\A([^;\s]+)/
SPACES_PATTERN          = /\A(\s+)/
QUESTION_PATTERN        = /\A\?/
COMMA_PATTERN           = /\A\,/
LPAREN_PATTERN          = /\A\(/
RPAREN_PATTERN          = /\A\)/
ACTUAL_COMMENT_PATTERN          = /\A(\/|\#)\*(\s{1,}(?:.*?))\*\1/m  ## start with spaces
SEMICOLON_AT_INPUT_END_PATTERN  = /\A\;\s*\Z/
UNMATCHED_COMMENT_START_PATTERN = /\A(?:(?:\/|\#)\*)/

#TODO: remove trailing spaces for S2Dao compatibility, but this spec sometimes causes SQL bugs...
ELSE_PATTERN            = /\A\-{2,}\s*ELSE\s*/
AND_PATTERN             = /\A(\ *AND)\b/i
OR_PATTERN              = /\A(\ *OR)\b/i


def parse( io )
  @q = []
  io.each_line(nil) do |whole|
    @s = StringScanner.new(whole)
  end
  scan_str
  @q.push [ false, nil ]
    
  ## cal racc's private parse method
  do_parse
end

## called by racc
def next_token
  @q.shift
end


def scan_str
  until @s.eos? do
    case
    when @s.scan(AND_PATTERN)
      @q.push [ :AND, @s[1] ]
    when @s.scan(OR_PATTERN)
      @q.push [ :OR, @s[1] ]
    when @s.scan(SPACES_PATTERN)
      @q.push [ :SPACES, @s[1] ]
    when @s.scan(QUESTION_PATTERN)
      @q.push [ :QUESTION, nil ]
    when @s.scan(COMMA_PATTERN)
      @q.push [ :COMMA, ',' ]
    when @s.scan(LPAREN_PATTERN)
      @q.push [ :LPAREN, '(' ]
    when @s.scan(RPAREN_PATTERN)
      @q.push [ :RPAREN, ')' ]
    when @s.scan(ELSE_PATTERN)
      @q.push [ :ELSE, nil ]
    when @s.scan(ACTUAL_COMMENT_PATTERN)
      @q.push [ :ACTUAL_COMMENT, [@s[1], @s[2]] ] if @preserve_comment
    when @s.scan(BEGIN_END_PATTERN)
      @q.push [ @s[2].intern, nil ]
    when @s.scan(CONDITIONAL_PATTERN)
      @q.push [ @s[2].intern, @s[3] ]
    when @s.scan(EMBED_VARIABLE_PATTERN)
      @q.push [ :EMBED_VARIABLE, @s[2] ]
    when @s.scan(PAREN_BIND_VARIABLE_PATTERN)
      @q.push [ :PAREN_BIND_VARIABLE, @s[2] ]
    when @s.scan(BIND_VARIABLE_PATTERN)
      @q.push [ :BIND_VARIABLE, @s[2] ]
    when @s.scan(STRING_LITERAL_PATTERN)
      @q.push [ :STRING_LITERAL, @s[1] ]
    when @s.scan(SPLIT_TOKEN_PATTERN)
      @q.push [ :IDENT, @s[1] ]
    when @s.scan(UNMATCHED_COMMENT_START_PATTERN)   ## unmatched comment start, '/*','#*'
      raise Racc::ParseError, "## unmatched comment. line:[#{line_no}], rest:[#{@s.rest}]"
    when @s.scan(LITERAL_PATTERN)   ## other string token
      @q.push [ :IDENT, @s[1] ]
    when @s.scan(SEMICOLON_AT_INPUT_END_PATTERN)
      #drop semicolon at input end
    else
      raise Racc::ParseError, "## cannot parse. line:[#{line_no}], rest:[#{@s.rest}]"
    end
  end
end


def line_no
  lines = 0
  scanned = @s.string[0..(@s.pos)]
  scanned.each_line { lines += 1 }
  lines
end
..end lib/twowaysql/parser.y modeval..iddfb0e44df1

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 20, :_reduce_1,
 0, 21, :_reduce_2,
 2, 21, :_reduce_3,
 1, 22, :_reduce_none,
 1, 22, :_reduce_none,
 1, 22, :_reduce_none,
 3, 25, :_reduce_7,
 4, 24, :_reduce_8,
 2, 27, :_reduce_9,
 0, 27, :_reduce_10,
 1, 26, :_reduce_none,
 1, 26, :_reduce_none,
 1, 26, :_reduce_none,
 2, 28, :_reduce_14,
 2, 29, :_reduce_15,
 1, 23, :_reduce_16,
 1, 23, :_reduce_17,
 1, 23, :_reduce_18,
 1, 23, :_reduce_19,
 1, 23, :_reduce_20,
 1, 23, :_reduce_21,
 1, 23, :_reduce_22,
 1, 23, :_reduce_23,
 1, 23, :_reduce_24,
 1, 23, :_reduce_25,
 1, 23, :_reduce_none,
 1, 23, :_reduce_none,
 2, 30, :_reduce_28,
 3, 30, :_reduce_29,
 2, 30, :_reduce_30,
 3, 30, :_reduce_31,
 1, 30, :_reduce_32,
 2, 31, :_reduce_33,
 3, 31, :_reduce_34 ]

racc_reduce_n = 35

racc_shift_n = 48

racc_action_table = [
     9,    36,    14,    37,    17,    19,    21,    23,    24,     4,
     6,     8,    11,    13,    15,    16,    18,     9,    39,    14,
    45,    17,    19,    21,    23,    24,     4,     6,     8,    11,
    13,    15,    16,    18,     9,    47,    14,    25,    17,    19,
    21,    23,    24,     4,     6,     8,    11,    13,    15,    16,
    18,     9,    38,    14,     3,    17,    19,    21,    23,    24,
     4,     6,     8,    11,    13,    15,    16,    18,     9,   nil,
    14,   nil,    17,    19,    21,    23,    24,     4,     6,     8,
    11,    13,    15,    16,    18,    33,    34,    35,    28,    30,
    28,    30,    43,    44 ]

racc_action_check = [
    42,    18,    42,    18,    42,    42,    42,    42,    42,    42,
    42,    42,    42,    42,    42,    42,    42,     2,    27,     2,
    37,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,    41,    40,    41,     3,    41,    41,
    41,    41,    41,    41,    41,    41,    41,    41,    41,    41,
    41,    26,    26,    26,     1,    26,    26,    26,    26,    26,
    26,    26,    26,    26,    26,    26,    26,    26,    32,   nil,
    32,   nil,    32,    32,    32,    32,    32,    32,    32,    32,
    32,    32,    32,    32,    32,    15,    15,    15,    39,    39,
    14,    14,    35,    35 ]

racc_action_pointer = [
   nil,    54,    15,    37,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    84,    77,   nil,   nil,    -7,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    49,    13,   nil,   nil,
   nil,   nil,    66,   nil,   nil,    84,   nil,    12,   nil,    82,
    32,    32,    -2,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
    -2,   -35,    -1,   -35,   -21,    -3,   -22,    -4,   -23,    -2,
    -5,   -24,    -6,   -25,    -2,   -35,   -32,   -18,   -35,   -19,
   -26,   -16,   -27,   -17,   -20,    48,   -35,   -10,    -2,   -11,
    -2,   -12,   -13,   -30,   -28,   -35,   -33,   -35,    -7,    -2,
   -35,   -14,   -15,   -31,   -29,   -34,    -9,    -8 ]

racc_goto_table = [
     2,    27,     1,    40,   nil,   nil,   nil,   nil,   nil,    26,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    46,   nil,    41,   nil,
    42 ]

racc_goto_check = [
     2,     7,     1,     8,   nil,   nil,   nil,   nil,   nil,     2,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     7,   nil,     2,   nil,
     2 ]

racc_goto_pointer = [
   nil,     2,     0,   nil,   nil,   nil,   nil,   -13,   -24,   nil,
   nil,   nil,   nil ]

racc_goto_default = [
   nil,   nil,    32,     5,     7,    10,    12,   nil,   nil,    29,
    31,    20,    22 ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :BEGIN => 2,
 :END => 3,
 :IF => 4,
 :ELSE => 5,
 :AND => 6,
 :OR => 7,
 :IDENT => 8,
 :STRING_LITERAL => 9,
 :SPACES => 10,
 :COMMA => 11,
 :LPAREN => 12,
 :RPAREN => 13,
 :QUESTION => 14,
 :ACTUAL_COMMENT => 15,
 :BIND_VARIABLE => 16,
 :PAREN_BIND_VARIABLE => 17,
 :EMBED_VARIABLE => 18 }

racc_use_result_var = true

racc_nt_base = 19

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
'IDENT',
'STRING_LITERAL',
'SPACES',
'COMMA',
'LPAREN',
'RPAREN',
'QUESTION',
'ACTUAL_COMMENT',
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
                  result = WhiteSpaceNode.new( val[0], @preserve_space )
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
                  result = ActualCommentNode.new( val[0][0] , val[0][1] )
   result
  end
.,.,

 # reduce 26 omitted

 # reduce 27 omitted

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 103
  def _reduce_28( val, _values, result )
                  result = BindVariableNode.new( val[0] )
   result
  end
.,.,

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
                  result = ParenBindVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 124
  def _reduce_33( val, _values, result )
                  result = EmbedVariableNode.new( val[0] )
   result
  end
.,.,

module_eval <<'.,.,', 'lib/twowaysql/parser.y', 128
  def _reduce_34( val, _values, result )
                  result = EmbedVariableNode.new( val[0] )
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

  end   # class Parser

end   # module TwoWaySQL
