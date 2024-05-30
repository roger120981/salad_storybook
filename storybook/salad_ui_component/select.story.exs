defmodule Storybook.SaladUIComponents.Select do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladStorybookWeb.SaladUIComponents

  def function, do: &SaladUI.Select.select/1

  def imports,
    do: [
      {SaladUI.Select,
       [
         select_trigger: 1,
         select_content: 1,
         select_group: 1,
         select_label: 1,
         select_item: 1,
         select_value: 1,
         select_separator: 1
       ]},
      {SaladUI.Button, [button: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :select,
        attributes: %{
          name: "fruit",
          target: "my-select",
          placeholder: "Select a fruit"
        },
        template: """
        <form>
          <.psb-variation />
          <.button type="submit" class="w-full mt-2">Submit</.button>
        </form>
        """,
        let: :select,
        slots: [
          """
            <.select_trigger instance={select} class="w-[180px]"/>
            <.select_content class="w-full" instance={select}>
              <.select_group>
                <.select_label>Fruits</.select_label>
                <.select_item instance={select} value="apple" label="Apple"></.select_item>
                <.select_item instance={select} value="banana" label="Banana"></.select_item>
                <.select_item instance={select}  value="blueberry"></.select_item>
                <.select_separator />
                <.select_item instance={select} disabled value="grapes"></.select_item>
                <.select_item instance={select} value="pineapple"></.select_item>
              </.select_group>
            </.select_content>
          """
        ]
      }
    ]
  end
end
