class Stack

	BASE = "https://api.stackexchange.com/"
	TAGS = "/2.2/tags"
	ACCESS_KEY = ENV['STACK_KEY']
	WRITE_FILE_PAGE = File.expand_path("~/Desktop/tags.txt")
	WRITE_ALL_FILE = File.expand_path("~/Desktop/all_tags.txt")

	attr_reader :tags

	def get_tags(page=1)
		params = {
			params: {
				order: "desc",
				sort: "popular",
				site: "stackoverflow",
				key: ACCESS_KEY,
				page: page
			},
			accept: :json
		}

		tags = JSON.parse(RestClient.get(BASE + TAGS,params))
	end

	def parse_tags(tags)
		items = tags["items"]
		items.map do |item|
			item["name"]
		end
	end

	def get_tags_up_to(page_num)
		File.open(WRITE_FILE,"w") do |file|
			page_num.times do |page|
				tags =  parse_tags(get_tags(page+1))
				tags.each do |tag|
					file.puts tag
				end
			end
		end
	end

	def get_all_tags
		File.open(WRITE_ALL_FILE,"w") do |file|
			page = 1
			tags = get_tags(page)
			parsed_tags = parse_tags(tags)

			parsed_tags.each do |tag|
				file.puts tag
			end

			while tags["has_more"]
				page += 1
				tags = get_tags(page)
				parsed_tags = parse_tags(tags)
				parsed_tags.each do |tag|
					file.puts tag
				end
			end
		end

	end



end