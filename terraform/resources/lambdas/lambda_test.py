def main(event, context):
   message = 'Hello {} !'.format(event['key1'])
   return {
       'message' : message
   }
