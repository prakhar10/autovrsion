#!/usr/bin/env ruby
require 'rugged'
require 'listen'
require 'colored'

class FileListen
	def lis(path)		
		repo=Rugged::Repository.new(path)
		#callback = Proc.new do |modified,added,removed|		
				listener = Listen.to(path) do |modified,added,removed|
			index = repo.index
			 user =  {
			 			name: repo.config['user.name'],
             			email: repo.config['user.email'],
             			time: Time.now
         			}

			commit_options = {}
				commit_options[:tree] = index.write_tree(repo)
				commit_options[:author] = user
				commit_options[:committer] = user
				commit_options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
				commit_options[:update_ref] = 'HEAD'

			if modified.empty? == false then


				m = modified
				index.add_all
				index.write
				commit_options[:message] ||= "#{m} modified "
				Rugged::Commit.create(repo,commit_options)
				puts "File Modified".yellow
			end

			if added.empty? == false then
				a = added
				#a.sub('[',' ')
				#a.sub(']',' ')
				index.add_all
				index.write
				commit_options[:message] ||= " #{a} added "
				Rugged::Commit.create(repo,commit_options)
				puts "File Added".green
			end

			if removed.empty? == false then
				r = removed
				commit_options[:message] ||= "#{r} removed "
				Rugged::Commit.create(repo, commit_options)
				puts "File Removed".red
			end

			
		end
		listener.start
		#sleep
		stop  = STDIN.gets
			if stop.to_i == 1
				listener.stop
				abort"Listener stopped"
			end	
		#listener.stop
	end
end