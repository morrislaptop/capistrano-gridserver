# http://stackoverflow.com/questions/21830172/capistrano-creating-task-to-change-current-symlink

namespace :gridserver do

  desc "Change current symlink to relative path"
  task :create_relative_symlink do
    on roles(:app) do

        info "Removing absolute current symlink"
        execute "rm -d #{current_path}"

        info "Creating relative current symlink"
        execute "cd #{fetch(:deploy_to)} && ln -s ./releases/#{File.basename release_path} current"

    end
  end

end