function distance = get_distance(city1, city2)

    [nums, text] = xlsread('Distances.xlsx');
    
    cities = text(1,:);
    city1_idx = find(strcmp(cities, city1)) - 1;
    city2_idx = find(strcmp(cities, city2)) - 1;
    distance = nums(city1_idx, city2_idx);
    if isempty(distance)
        distance = -1;
    end
end

%city1 = 'Abilene, TX'
%city2 = 'Akron, OH'