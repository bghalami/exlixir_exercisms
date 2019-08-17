defmodule RobotSimulator do

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0,0}) do
    cond do
      direction_valid?(direction) && position_valid?(position)  ->
        %{direction: direction, position: position}
      direction_valid?(direction) ->
        {:error, "invalid position"}
      position_valid?(position) ->
        {:error, "invalid direction"}
    end
  end

  defp direction_valid?(:north), do: true
  defp direction_valid?(:south), do: true
  defp direction_valid?(:east), do: true
  defp direction_valid?(:west), do: true
  defp direction_valid?(_), do: false

  defp position_valid?({x,y}) when is_number(x) and is_number(y), do: true
  defp position_valid?(_position), do: false


  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) when instructions == "", do: robot
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

  defp move_robot( %{ direction: :north, position: {x,y} }, "L"), do: %{direction: :west, position: {x,y} }
  defp move_robot( %{ direction: :north, position: {x,y} }, "R"), do: %{direction: :east, position: {x,y} }
  defp move_robot( %{ direction: :north, position: {x,y} }, "A"), do: %{direction: :north, position: {x,y + 1} }
  defp move_robot( %{ direction: :east, position: {x,y} }, "L"), do: %{direction: :north, position: {x,y} }
  defp move_robot( %{ direction: :east, position: {x,y} }, "R"), do: %{direction: :south, position: {x,y} }
  defp move_robot( %{ direction: :east, position: {x,y} }, "A"), do: %{direction: :east, position: {x + 1,y} }
  defp move_robot( %{ direction: :south, position: {x,y} }, "L"), do: %{direction: :east, position: {x,y} }
  defp move_robot( %{ direction: :south, position: {x,y} }, "R"), do: %{direction: :west, position: {x,y} }
  defp move_robot( %{ direction: :south, position: {x,y} }, "A"), do: %{direction: :south, position: {x,y - 1} }
  defp move_robot( %{ direction: :west, position: {x,y} }, "L"), do: %{direction: :south, position: {x,y} }
  defp move_robot( %{ direction: :west, position: {x,y} }, "R"), do: %{direction: :north, position: {x,y} }
  defp move_robot( %{ direction: :west, position: {x,y} }, "A"), do: %{direction: :west, position: {x - 1,y} }

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
