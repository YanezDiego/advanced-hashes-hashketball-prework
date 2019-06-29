# Write your code here!
require 'pry'

def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end




def num_points_scored(name)
    points = 0

    game_hash.each do |key, values|
        values[:players].each do |athletes|
            if athletes[:player_name] == name
                points = athletes[:points]
            end
        end
    end
    points
end


def shoe_size(name)
    size = 0
    game_hash.each do |key, values|
        values[:players].each do |athletes|
            if athletes[:player_name] == name
                size = athletes[:shoe]
            end
        end
    end
    size
end


def team_colors(team)
    game_hash.each do |key, values|
        if values[:team_name] == team
            return values[:colors]
        end
    end
end

def team_names
    teams = []

    game_hash.each do |key, values|
        if key == :away || key == :home
            teams.push(values[:team_name])
        end
    end
    teams
end

def player_numbers(team)
    jerseys = []

    game_hash.each do |key, values|
        if values[:team_name] == team
            values[:players].collect do |athletes|
                jerseys.push(athletes[:number])
            end
        end
    end
    jerseys
end

def player_stats(name)
    stats = {}
    game_hash.each do |keys, values|
        values[:players].each do |athletes|
            if athletes[:player_name] == name
                stats = athletes
            end
        end
    end
    stats.delete(:player_name)
    stats
end


def big_shoe_rebounds
    shoes_store = 0
    rebounds = 0
    game_hash.each do |keys, values|
        values[:players].each do |athletes|
            if shoes_store < athletes[:shoe]
                shoes_store = athletes[:shoe]
                rebounds = athletes[:rebounds]
            end
        end
    end
    rebounds
end

def most_points_scored
    points = 0
    name = ''
    game_hash.each do |k, v|
        v[:players].each do |athletes|
            if points < athletes[:points]
                points = athletes[:points]
                name = athletes[:player_name]
            end
        end
    end
    name
end

def winning_team
    points_a = 0
    team_a_name = ''

    points_h = 0
    team_h_name = ''

    game_hash.each do |k, v|
        if k == :away
            team_a_name = v[:team_name]
            v[:players].each{|athletes| points_a += athletes[:points]}
            
        elsif k == :home 
            team_h_name = v[:team_name]
            v[:players].each{|athletes| points_h += athletes[:points]}
        end
    end

    if points_a > points_h
        team_a_name
    else
        team_h_name
    end

end

def player_with_longest_name
    name = ""

    game_hash.each do |k, v|
        v[:players].each do |athletes|
            if name.length < athletes[:player_name].length
                name = athletes[:player_name]
            end
        end
    end
    name
end

def long_name_steals_a_ton?
    steals = 0
    high_steals_obj = {}

    game_hash.each do |k, v|
        v[:players].each do |athletes|
            if steals < athletes[:steals]
                steals = athletes[:steals]
                high_steals_obj = athletes
            end
        end
    end

    if high_steals_obj[:player_name] == player_with_longest_name
        return true
    else
        return false
    end

end