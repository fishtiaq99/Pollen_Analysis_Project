% team info
disp('Names: Eshaal Malik(23I-0732) , Fatima Ishtiaq(23I-0696) , Maimoona Imran(23I-0653)');

% program termination
end_task = false;

while ~end_task
    % user input to continue
    disp('Press any key to continue.');
    pause;

    % given data
    days = 1:60;
    pollen = [5, 16, 31, 50, 73, 100, 131, 166, 205, 248, 295, 346, 401, 460, 523, 590, 661, 736, 815, 898, 985, 1076, 1171, 1270, 1373, 1480, 1591, 1706, 1825, 1948, 2075, 2206, 2341, 2480, 2623, 2770, 2921, 3076, 3235, 3398, 3565, 3736, 3911, 4090, 4273, 4460, 4651, 4846, 5045, 5248, 5455, 5666, 5881, 6100, 6323, 6550, 6781, 7016, 7255, 7498];

    % task 1
    disp('Task 1: ');
    equation = polyfit(days, pollen, 2);
    disp('The Coefficients of the Quadratic Curve are:');
    disp(equation);

    % plot graph
    figure;
    hold on;
    plot(days, pollen, 'r-');
    xlabel('No of Days');
    ylabel('Pollen Count (in m^3)');
    title('Graph of Pollen Count vs No of Days');

    % ask if the user wishes to run another query or terminate the program
    input_query = input('Do you wish to run another task? (y/n): ', 's');
    if strcmpi(input_query, 'n')
        end_task = true;
        disp('Terminating Program');
    end

    % task 2
    if ~end_task
        disp('Task 2: ');
        % derivative of the quadratic equation
        syms x;
        der = diff(poly2sym(equation, x));
        roots_der = solve(der, x);
        
        % find the roots of the equation
        roots_der = double(roots_der(imag(roots_der) == 0 & real(roots_der) >= 1 & real(roots_der) <= 60));
        
        if ~isempty(roots_der)
            disp('Number of Days when pollen count in the air is reduced:');
            disp(roots_der);
        else
            disp('The pollen count does not get reduced within the given 60 day range.');
        end

       % ask if the user wishes to run another query or terminate the program
        input_query = input('Do you wish to run another task? (y/n): ', 's');
        if strcmpi(input_query, 'n')
            end_task = true;
            disp('Terminating Program');
        end
    end

    % task 3
    if ~end_task
        disp('Task 3: ');
        Nov_15 = 76; % October has 31 days so November 15th becomes the 76th day
        pollen_Nov_15 = polyval(equation, Nov_15);
        disp(['Pollen count on 15th November (Day ', num2str(Nov_15), '):']);
        disp(pollen_Nov_15);

        % ask if the user wishes to run another query or terminate the program
        input_query = input('Do you wish to run another task? (y/n): ', 's');
        if strcmpi(input_query, 'n')
            end_task = true;
            disp('Terminating Program');
        end
    end

    % task 4
    if ~end_task
        disp('Task 4: ');
        roots_equation = roots(equation);
        no_pollen = round(roots_equation(roots_equation >= 0 & roots_equation <= 60));
       
        % display the day when pollen count in air becomes 0
        if ~isempty(no_pollen)
            day_no_pollen = date_from_day(no_pollen);
            disp(['Day when Pollen Count in air becomes 0 (if possible): ', day_no_pollen]);
        else
            disp('Pollen Count in air is never 0');
        end

    end
        % ask if the user wishes to run another query or terminate the program
        input_query = input('Do you wish to run another task? (y/n): ', 's');
        if strcmpi(input_query, 'n')
            end_task = true;
            disp('Terminating Program');
        end
end

% function to convert day number to date and month
function day = date_from_day(day_number)
    % the year starts on September 1
    start_day = datetime('01-Sep-2023');
    pollen_zero_day = start_day + days(day_number - 1);
    day = datestr(pollen_zero_day, 'dd-mmm-yy');
end
