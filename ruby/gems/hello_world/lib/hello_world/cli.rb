# frozen_string_literal: true

require_relative 'parser'
require 'colored2'
module HelloWorld
  class CLI
    attr_reader :stdin, :stdout, :stderr, :kernel, :argv, :args

    class << self
      def create(
        argv: ARGV.dup,
        stdin: STDIN,
        stdout: STDOUT,
        stderr: STDERR,
        kernel: ::Kernel
      )
        new(argv, stdin, stdout, stderr, kernel)
      end
    end

    def initialize(argv = ARGV.dup, stdin = STDIN, stdout = STDOUT, stderr = STDERR, kernel = ::Kernel)
      @argv   = argv
      @stdin  = stdin
      @stdout = stdout
      @stderr = stderr
      @kernel = kernel

      @args = Parser.parse(@argv, self)
    end

    def execute!
      return if args.help

      output = if args.list
                 hw_hash.keys.join("\n")
               elsif args.language
                 ln = hw.determine_language(args.language)
                 "#{ln.to_s.capitalize.bold.blue} — #{hw.hello_world_in(ln).yellow}"
               end

      response(output)
    end

    def response(text)
      puts text
    end

    def hw_hash
      HelloWorld::HELLO_WORLD
    end

    def hw
      HelloWorld
    end
  end
end
