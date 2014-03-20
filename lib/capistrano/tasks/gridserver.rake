# http://stackoverflow.com/questions/21830172/capistrano-creating-task-to-change-current-symlink

namespace :gridserver do

  desc "Change current symlink to relative path"
  task :create_relative_symlinks do
    on roles(:app) do

      # Only change current symlink if NEW deploy
      unless release_path == current_path
	      info "Removing absolute current symlink"
	      execute "rm -d #{current_path}"

	      info "Creating relative current symlink"
	      execute "cd #{fetch(:deploy_to)} && ln -s ./releases/#{File.basename release_path} current"
	  end

	  # Always recreate the linked_dirs
      info "Removing absolute linked_dirs"
      next unless any? :linked_dirs
      on release_roles :all do
        fetch(:linked_dirs).each do |dir|
          target = release_path.join(dir)
          source = shared_path.join(dir)
          source = source.relative_path_from(target)
          if test "[ -d #{target} ]"
            execute :rm, '-rf', target
          end
          execute :ln, '-s', source, target
        end
      end
    end
  end
end