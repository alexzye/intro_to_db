import sys, os

# python inserter.py path table type type type type

# Command line argument helpers
argc = len(sys.argv)
argv = sys.argv

# if argc < 4:
#     print 'Usage: python inserter.py path output table type type type'
#     sys.exit(0)

for file in os.listdir("."):
    if file.endswith('.csv'):
        csv=open(file)

        table=file.split('.')[0]
        output = open("outputs/-build-"+table+'.sql', 'w+')
        for i,line in enumerate(csv):
            query = "INSERT INTO `"+table + "` VALUES("
            if i > 0:
                data=line.strip().split(',')
                for j in data:
                    query+=j+","
                query=query[:-1]
                query+=");\n"
                output.write(query)
        output.close()
        csv.close()


