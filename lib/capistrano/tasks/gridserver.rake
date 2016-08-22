# http://stackoverflow.com/questions/21830172/capistrano-creating-task-to-change-current-symlink

namespace :gridserver do

  desc "Change current symlink to relative path"
  task :create_relative_symlinks do
    on roles(:app) do

      # Only change current symlink if NEW deploy
      unless release_path == current_path
        info "Removing absolute current symlink"
        execute "unlink #{current_path}"

        info "Creating relative current symlink"
        execute "cd #{fetch(:deploy_to)} && ln -s ./releases/#{File.basename release_path} current"
      end

      # Always recreate the linked_dirs
      info "Removing absolute linked_dirs and creating relative linked_dirs"
      next unless any? :linked_dirs
      on release_roles :all do
        fetch(:linked_dirs).each do |dir|
          target = release_path.join(dir)
          source = shared_path.join(dir)
          relative = Pathname.new('../' * (dir.count('/') + 2)).join('shared').join(dir) # 2 for releases/timestamp
          if test "[ -d #{target} ]"
            execute :rm, '-rf', target
          end
          execute :ln, '-s', relative, target
        end
      end
      next unless any? :linked_files
      on release_roles :all do
        fetch(:linked_files).each do |dir|
          target = release_path.join(dir)
          source = shared_path.join(dir)
          relative = Pathname.new('../' * (dir.count('/') + 2)).join('shared').join(dir) # 2 for releases/timestamp
          # added f flag to remove if exists
          execute :ln, '-sf', relative, target
        end
      end
    end
  end
end
