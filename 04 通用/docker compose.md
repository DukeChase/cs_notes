https://docs.docker.com/reference/compose-file


```yaml
version: '3'
name: myapp
services: 
	eureka:
		build: .
		ports:
			- "8761:8761"
		command: 
		dns: 8.8.8.8
		environment: 
			RACK_ENV: development
			SHOW: 'ture'
		env_file: 
			- .env
		expose:
			- '3000'
		image: java
		links:
		external_links:
		networks:
		network_mode:
networks:
volumes:
```