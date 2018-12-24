defmodule MerryChristmas.Messenger do
	require Logger
	alias __MODULE__.MessageRecipient, as: MR
	alias MerryChristmas.Repo
	import Ecto.Query

	def create_recipient do
		IO.puts """
			Messenger.create_recipient(name[string], route[string])
		"""
	end

	def create_recipient(name, route) do
		%MR{}
		|> MR.changeset(%{name: name, route: route, viewed: false})
		|> Repo.insert!
	end

	def valid_and_unviewed?(route) do
		MR
		|> where([mr], mr.route == ^route)
		|> Repo.one
		|> case do
				%MR{viewed: false} = mr -> mr
				%MR{viewed: true} -> false
				nil ->
					Logger.info "Someone tried accessing a route that doesn't exist: #{inspect route}"
					false
				_ ->
					Logger.info "Weird return for Messenger#valid_and_unviewed with arg route: #{inspect route}"
			end
	end

	def set_viewed(%MR{} = mr) do
		mr
		|> MR.changeset(%{viewed: true})
		|> Repo.update
		|> case do
				{:ok, _} -> true
				{:error, error} -> 
					Logger.error "error setting viewed: #{inspect error}"
					true
			end
	end

	def set_unviewed(route) do
		MR
		|> where([mr], mr.route == ^route)
		|> Repo.one!
		|> MR.changeset(%{viewed: false})
		|> Repo.update
		|> case do
				{:ok, _} -> true
				{:error, error} -> 
					Logger.error "error setting viewed: #{inspect error}"
					true
			end
	end
end