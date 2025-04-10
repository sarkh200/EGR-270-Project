function [choice_model, choice_floor] = main_menu()
    prompt_model = "Which Roomba model are you using?";
    model_options = ["Economy", "Regular", "High End"];
    choice_model = menu(prompt_model, model_options);

    prompt_floor = "Which floor plan are you using?";
    floor_options = ["Floor Plan 1", "Floor Plan 2", "Floor Plan 3", "Floor Plan 4"];
    choice_floor = menu(prompt_floor, floor_options);
end
