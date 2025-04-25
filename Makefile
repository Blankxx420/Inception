# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brguicho <brguicho@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/25 22:14:27 by brguicho          #+#    #+#              #
#    Updated: 2025/04/25 22:21:24 by brguicho         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


PATH_COMPOSE_FILE = ./srcs/docker-compose.yml

all : up

build :
	@docker-compose -f $(PATH_COMPOSE_FILE) build

up : 
	@docker-compose -f $(PATH_COMPOSE_FILE) up -d

down : 
	@docker-compose -f $(PATH_COMPOSE_FILE) down

stop : 
	@docker-compose -f $(PATH_COMPOSE_FILE) stop

start : 
	@docker-compose -f $(PATH_COMPOSE_FILE) start

status : 
	@docker ps

.PHONY: down build down up status stop start