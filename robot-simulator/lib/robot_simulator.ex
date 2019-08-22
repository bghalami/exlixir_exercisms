defmodule RobotSimulator do
  defguard is_position(x,y) when is_integer(x) and is_integer(y)
  defguard is_direction(direction) when direction == :north or direction == :south or direction == :west or direction == :east


  @doc """
  Create a Robot Simulator given an initial direction and position.
  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0,0})
  def create(direction, position = {x,y}) when is_direction(direction) and is_position(x,y) do
    %{direction: direction, position: position}
  end
  def create(_direction, {x,y}) when is_position(x,y), do: {:error, "invalid direction"}
  def create(direction, _position) when is_direction(direction), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.
  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot
  def simulate(robot, instructions) do
    if valid_instructions?(instructions) do
      robot
      |> move_robot(String.first(instructions))
      |> simulate(String.slice(instructions, 1, 1500))
    else
      {:error, "invalid instruction"}
    end
  end

  defp valid_instructions?(instructions) do
    instructions
    |> String.graphemes()
    |> Enum.all?( &(&1 == "A" || &1 == "L" || &1 == "R") )
  end

  defp move_robot( robot = %{ direction: :north }, "L"), do: %{ robot | direction: :west }
  defp move_robot( robot = %{ direction: :north }, "R"), do: %{ robot | direction: :east }
  defp move_robot( robot = %{ direction: :north, position: {x,y} }, "A"), do: %{ robot | position: {x,y + 1} }
  defp move_robot( robot = %{ direction: :east }, "L"), do: %{ robot | direction: :north }
  defp move_robot( robot = %{ direction: :east }, "R"), do: %{ robot | direction: :south }
  defp move_robot( robot = %{ direction: :east,  position: {x,y} }, "A"), do: %{ robot | position: {x + 1,y} }
  defp move_robot( robot = %{ direction: :south }, "L"), do: %{ robot | direction: :east }
  defp move_robot( robot = %{ direction: :south }, "R"), do: %{ robot | direction: :west }
  defp move_robot( robot = %{ direction: :south, position: {x,y} }, "A"), do: %{ robot | position: {x,y - 1} }
  defp move_robot( robot = %{ direction: :west }, "L"), do: %{ robot | direction: :south }
  defp move_robot( robot = %{ direction: :west }, "R"), do: %{ robot | direction: :north }
  defp move_robot( robot = %{ direction: :west,  position: {x,y} }, "A"), do: %{ robot | position: {x - 1,y} }

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: dir}), do: dir

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: pos}), do: pos
end
