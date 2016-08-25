defmodule Compass.Adapters.OrientDB.Connection do
  @moduledoc false

  alias Orientex.Query

  @behaviour Ecto.Adapters.SQL.Connection

  @spec child_spec(options :: Keyword.t) :: {module, Keyword.t}
  def child_spec(opts) do
    Orientex.child_spec(opts)
  end

  @spec prepare_execute(
    connection :: DBConnection.t,
    name :: String.t,
    Ecto.Adapters.SQL.Connection.prepared,
    params :: [term],
    options :: Keyword.t
  ) :: {:ok, query :: map, term} | {:error, Exception.t}
  def prepare_execute(conn, name, sql, params, opts) do
    # IO.puts "Compass.Connection.prepare_execute()"
    query = %Query{name: name, statement: sql, request: :request_command}
    DBConnection.prepare_execute(conn, query, params, opts)
  end

  @spec execute(
    connection :: DBConnection.t,
    prepared_query :: Ecto.Adapters.SQL.Connection.prepared | Ecto.Adapters.SQL.Connection.cached,
    params :: [term],
    options :: Keyword.t
  ) :: {:ok, term} | {:error, Exception.t}
  def execute(conn, sql, params, opts) do
    # IO.puts "Compass.Connection.execute()"
  end

  @spec to_constraints(exception :: Exception.t) :: Keyword.t
  def to_constraints(exception) do
    # IO.puts "Compass.Connection.to_constraints()"
  end

  @spec all(query :: Ecto.Query.t) :: String.t
  def all(query) do
    # IO.puts "Compass.Connection.all()"
    select = get_select(query.select)
    from = get_from(query.from)
    build_sql([select, from])
  end

  @spec update_all(query :: Ecto.Query.t) :: String.t
  def update_all(query) do
    # IO.puts "Compass.Connection.update_all()"
  end

  @spec delete_all(query :: Ecto.Query.t) :: String.t
  def delete_all(query) do
    # IO.puts "Compass.Connection.delete_all()"
  end

  @spec insert(prefix ::String.t, table :: String.t, header :: [atom], rows :: [[atom | nil]], returning :: [atom])
    :: String.t
  def insert(prefix, table, header, rows, returning) do
    # IO.puts "Compass.Connection.insert()"
  end

  @spec update(prefix :: String.t, table :: String.t, fields :: [atom], filters :: [atom], returning :: [atom])
    :: String.t
  def update(prefix, table, fields, filters, returning) do
    # IO.puts "Compass.Connection.update()"
  end

  @spec delete(prefix :: String.t, table :: String.t, filters :: [atom], returning :: [atom]) :: String.t
  def delete(prefix, table, filters, returning) do
    # IO.puts "Compass.Connection.delete()"
  end

  @spec execute_ddl(command :: Ecto.Adapter.Migration.command) :: String.t
  def execute_ddl(command) do
    # IO.puts "Compass.Connection.execute_ddl()"
  end

  defp build_sql(list), do: Enum.join(list, " ")

  defp expr({:&, _, [_, fields, _]}) do
    Enum.map_join(fields, ", ", &translate_rid(&1))
  end

  defp get_from({from, _}), do: "FROM #{from}"

  defp get_select(%{fields: fields}) do
    "SELECT " <> Enum.map_join(fields, ", ", &expr(&1))
  end

  defp translate_rid(:rid), do: "@rid"
  defp translate_rid(field), do: field
end
