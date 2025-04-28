function [choice_model, choice_floor] = main_menu()
    % Input Arguments:
    % None
    % Output Arguments:
    % Choice_model = User input for the roomba model
    % Choice_floor = User input for the floor plan
    prompt_model = "Which Roomba model are you using?";
    model_options = ["Economy", "Regular", "High End"];
    choice_model = menu(prompt_model, model_options);

    prompt = {'Enter floor name:'};
    dlgtitle = 'Floor Name';
    fieldsize = [1 45];
    choice_floor = inputdlg(prompt, dlgtitle, fieldsize);
    choice_floor = choice_floor{1};
end
